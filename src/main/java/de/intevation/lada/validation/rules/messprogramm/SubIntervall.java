/* Copyright (C) 2013 by Bundesamt fuer Strahlenschutz
 * Software engineering by Intevation GmbH
 *
 * This file is Free Software under the GNU GPL (v>=3)
 * and comes with ABSOLUTELY NO WARRANTY! Check out
 * the documentation coming with IMIS-Labordaten-Application for details.
 */
package de.intevation.lada.validation.rules.messprogramm;

import java.util.Hashtable;
import java.util.Set;

import de.intevation.lada.model.land.Messprogramm;
import de.intevation.lada.validation.Violation;
import de.intevation.lada.validation.annotation.ValidationRule;
import de.intevation.lada.validation.rules.Rule;

/**
 * Validation rule for Messprogramm.
 * Validates if the subintervall period is meaningful.
 */
@ValidationRule("Messprogramm")
public class SubIntervall implements Rule {

    private Hashtable<String, Integer> intervallMax;

    public SubIntervall() {
        this.intervallMax = new Hashtable<String, Integer>();

        this.intervallMax.put("J",  365);
        this.intervallMax.put("H",  183);
        this.intervallMax.put("Q",  91);
        this.intervallMax.put("M",  31);
        this.intervallMax.put("W4", 28);
        this.intervallMax.put("W2", 14);
        this.intervallMax.put("W",  7);
        this.intervallMax.put("T",  1);
    }

    @Override
    public Violation execute(Object object) {
        Messprogramm messprogramm = (Messprogramm)object;
        Violation violation = new Violation();

        String probenintervall = messprogramm.getProbenintervall();
        Integer teilVon = messprogramm.getTeilintervallVon();
        Integer teilBis = messprogramm.getTeilintervallBis();
        Integer offset = messprogramm.getIntervallOffset();

        // skip this validation if mandatory fields not given
        if (probenintervall != null
            && teilVon != null
            && teilBis != null
        ) {
            // lower limits are independent of intervall type
            if (teilVon < 1) {
                violation.addError("teilintervallVon", 612);
            }
            if (teilBis < 1) {
                violation.addError("teilintervallBis", 612);
            }
            if (offset != null && offset < 0) {
                violation.addError("intervallOffset", 612);
            }

            // upper limits depend on (valid) intervall type
            Set<String> probenintervallSet = intervallMax.keySet();
            if (!probenintervallSet.contains(probenintervall)) {
                violation.addError("probenintervall", 612);
            } else {
                for (String intervallKey : probenintervallSet) {
                    if (intervallKey.equals(probenintervall)) {
                        if (teilVon > intervallMax.get(intervallKey)) {
                            violation.addError("teilintervallVon", 612);
                        }
                        if (teilBis > intervallMax.get(intervallKey)) {
                            violation.addError("teilintervallBis", 612);
                        }
                        if (offset != null
                            && offset > intervallMax.get(intervallKey) - 1) {
                            violation.addError("intervallOffset", 612);
                        }
                    }
                }
            }

            // lower limit has to be less than upper limit
            if (teilVon > teilBis) {
                violation.addError("teilintervallVon", 662);
                violation.addError("teilintervallBis", 662);
            }
        }

        return violation.hasErrors()
            ? violation
            :null;
    }
}
