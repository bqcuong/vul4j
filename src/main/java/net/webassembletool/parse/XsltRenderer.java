package net.webassembletool.parse;

import java.io.IOException;
import java.io.StringReader;
import java.io.Writer;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import net.webassembletool.ProcessingFailedException;
import net.webassembletool.RenderingException;
import net.webassembletool.RetrieveException;
import net.webassembletool.output.StringOutput;

import org.apache.xml.serializer.DOMSerializer;
import org.apache.xml.serializer.Method;
import org.apache.xml.serializer.OutputPropertiesFactory;
import org.apache.xml.serializer.Serializer;
import org.apache.xml.serializer.SerializerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * TODO Type javadoc
 * 
 * @author satyr
 */
public class XsltRenderer implements Renderer {
    private final XPathExpression expr;
    private final Transformer transformer;

    public XsltRenderer(XPathExpression expr) {
        this.expr = expr;
        this.transformer = null;

        // TODO [stas]: add xslt support
        // TransformerFactory tFactory = TransformerFactory.newInstance();
        // if (template != null) {
        // InputStream templateStream = ctx.getResourceAsStream(template);
        // try {
        // transformer = tFactory.newTransformer(new StreamSource(
        // templateStream));
        // } finally {
        // templateStream.close();
        // }
        // } else {
        // transformer = null;
        // }
    }

    /** {@inheritDoc} */
    public void render(StringOutput src, Writer out, Map<String, String> unused)
            throws IOException, RenderingException {
        if (src.getStatusCode() != HttpServletResponse.SC_OK) {
            throw new RetrieveException(src.getStatusCode(), src
                    .getStatusMessage(), src.toString());
        }

        try {
            Document document = createSourceDocument(src);
            Node xpathed;
            if (expr != null) {
                xpathed = (Node) expr.evaluate(document, XPathConstants.NODE);
            } else {
                xpathed = document;
            }

            // if (transformer != null) {
            // transformer
            // .transform(new DOMSource(xpathed), new StreamResult(out));
            // } else {
            Properties props = OutputPropertiesFactory
                    .getDefaultMethodProperties(Method.HTML);
            Serializer ser = SerializerFactory.getSerializer(props);
            ser.setWriter(out);
            DOMSerializer dSer = ser.asDOMSerializer();
            dSer.serialize(xpathed);
            // }
        } catch (SAXException e) {
            throw new ProcessingFailedException("unable to parse source", e);
        } catch (ParserConfigurationException e) {
            throw new ProcessingFailedException("unable to create DOM builder",
                    e);
        } catch (XPathExpressionException e) {
            throw new ProcessingFailedException(
                    "failed to evaluate XPath expression", e);
        }
    }

    protected Document createSourceDocument(StringOutput src)
            throws SAXException, IOException, ParserConfigurationException {
        return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
                new InputSource(new StringReader(src.toString())));
    }

    public static XsltRendererBuilder builder() {
        return new XsltRendererBuilder();
    }

    public static class XsltRendererBuilder {
        private XPathExpression expr;

        // private Transformer transformer;

        XsltRendererBuilder() {
        }

        public XsltRendererBuilder xpath(String xpath)
                throws XPathExpressionException {
            if (xpath != null) {
                XPath xpathObj = XPathFactory.newInstance().newXPath();
                expr = xpathObj.compile(xpath);
            } else {
                expr = null;
            }

            return this;
        }

        public XsltRenderer result() {
            return new XsltRenderer(expr);
        }
    }
}
