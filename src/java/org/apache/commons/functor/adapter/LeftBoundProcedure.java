/*
 * Copyright 2003,2004 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.commons.functor.adapter;

import java.io.Serializable;

import org.apache.commons.functor.BinaryProcedure;
import org.apache.commons.functor.UnaryProcedure;

/**
 * Adapts a
 * {@link BinaryProcedure BinaryProcedure} 
 * to the 
 * {@link UnaryProcedure UnaryProcedure} interface 
 * using a constant left-side argument.
 * <p/>
 * Note that although this class implements 
 * {@link Serializable}, a given instance will
 * only be truly <code>Serializable</code> if the
 * underlying objects are.  Attempts to serialize
 * an instance whose delegates are not 
 * <code>Serializable</code> will result in an exception.
 * 
 * @version $Revision: 1.3 $ $Date: 2004/02/28 03:35:23 $
 * @author Rodney Waldhoff
 */
public final class LeftBoundProcedure implements UnaryProcedure, Serializable {
    /**
     * @param procedure the procedure to adapt
     * @param arg the constant argument to use
     */
    public LeftBoundProcedure(BinaryProcedure procedure, Object arg) {
        this.procedure = procedure;
        this.param = arg;
    }
 
    public void run(Object obj) {
        procedure.run(param,obj);
    }   

    public boolean equals(Object that) {
        if(that instanceof LeftBoundProcedure) {
            return equals((LeftBoundProcedure)that);
        } else {
            return false;
        }
    }
        
    public boolean equals(LeftBoundProcedure that) {
        return that == this || ( 
                (null != that) && 
                (null == procedure ? null == that.procedure : procedure.equals(that.procedure)) &&
                (null == param ? null == that.param : param.equals(that.param)) );
                
    }
    
    public int hashCode() {
        int hash = "LeftBoundProcedure".hashCode();
        if(null != procedure) {
            hash <<= 2;
            hash ^= procedure.hashCode();
        }
        if(null != param) {
            hash <<= 2;
            hash ^= param.hashCode();
        }
        return hash;
    }
    
    public String toString() {
        return "LeftBoundProcedure<" + procedure + "(" + param + ",?)>";
    }

    public static LeftBoundProcedure bind(BinaryProcedure procedure, Object arg) {
        return null == procedure ? null : new LeftBoundProcedure(procedure,arg);
    }

    /** The {@link BinaryProcedure BinaryProcedure} I'm wrapping. */
    private BinaryProcedure procedure = null;
    /** The parameter to pass to that procedure. */
    private Object param = null;
}
