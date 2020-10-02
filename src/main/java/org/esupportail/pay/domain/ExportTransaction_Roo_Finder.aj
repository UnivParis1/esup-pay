// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.esupportail.pay.domain;

import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.esupportail.pay.domain.ExportTransaction;

privileged aspect ExportTransaction_Roo_Finder {
    
    public static Long ExportTransaction.countFindExportTransactionsByDateRemiseAndStatutEqualsAndNumContratEquals(Date dateRemise, String statut, String numContrat) {
        if (dateRemise == null) throw new IllegalArgumentException("The dateRemise argument is required");
        if (statut == null || statut.length() == 0) throw new IllegalArgumentException("The statut argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ExportTransaction AS o WHERE o.dateRemise = :dateRemise AND o.statut = :statut  AND o.numContrat = :numContrat", Long.class);
        q.setParameter("dateRemise", dateRemise);
        q.setParameter("statut", statut);
        q.setParameter("numContrat", numContrat);
        return ((Long) q.getSingleResult());
    }
    
    public static Long ExportTransaction.countFindExportTransactionsByNumTransactionEqualsAndNumContratEquals(String numTransaction, String numContrat) {
        if (numTransaction == null || numTransaction.length() == 0) throw new IllegalArgumentException("The numTransaction argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ExportTransaction AS o WHERE o.numTransaction = :numTransaction  AND o.numContrat = :numContrat", Long.class);
        q.setParameter("numTransaction", numTransaction);
        q.setParameter("numContrat", numContrat);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<ExportTransaction> ExportTransaction.findExportTransactionsByDateRemiseAndStatutEqualsAndNumContratEquals(Date dateRemise, String statut, String numContrat) {
        if (dateRemise == null) throw new IllegalArgumentException("The dateRemise argument is required");
        if (statut == null || statut.length() == 0) throw new IllegalArgumentException("The statut argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        TypedQuery<ExportTransaction> q = em.createQuery("SELECT o FROM ExportTransaction AS o WHERE o.dateRemise = :dateRemise AND o.statut = :statut  AND o.numContrat = :numContrat", ExportTransaction.class);
        q.setParameter("dateRemise", dateRemise);
        q.setParameter("statut", statut);
        q.setParameter("numContrat", numContrat);
        return q;
    }
    
    public static TypedQuery<ExportTransaction> ExportTransaction.findExportTransactionsByDateRemiseAndStatutEqualsAndNumContratEquals(Date dateRemise, String statut, String numContrat, String sortFieldName, String sortOrder) {
        if (dateRemise == null) throw new IllegalArgumentException("The dateRemise argument is required");
        if (statut == null || statut.length() == 0) throw new IllegalArgumentException("The statut argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ExportTransaction AS o WHERE o.dateRemise = :dateRemise AND o.statut = :statut  AND o.numContrat = :numContrat");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ExportTransaction> q = em.createQuery(queryBuilder.toString(), ExportTransaction.class);
        q.setParameter("dateRemise", dateRemise);
        q.setParameter("statut", statut);
        q.setParameter("numContrat", numContrat);
        return q;
    }
    
    public static TypedQuery<ExportTransaction> ExportTransaction.findExportTransactionsByNumTransactionEqualsAndNumContratEquals(String numTransaction, String numContrat) {
        if (numTransaction == null || numTransaction.length() == 0) throw new IllegalArgumentException("The numTransaction argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        TypedQuery<ExportTransaction> q = em.createQuery("SELECT o FROM ExportTransaction AS o WHERE o.numTransaction = :numTransaction  AND o.numContrat = :numContrat", ExportTransaction.class);
        q.setParameter("numTransaction", numTransaction);
        q.setParameter("numContrat", numContrat);
        return q;
    }
    
    public static TypedQuery<ExportTransaction> ExportTransaction.findExportTransactionsByNumTransactionEqualsAndNumContratEquals(String numTransaction, String numContrat, String sortFieldName, String sortOrder) {
        if (numTransaction == null || numTransaction.length() == 0) throw new IllegalArgumentException("The numTransaction argument is required");
        if (numContrat == null || numContrat.length() == 0) throw new IllegalArgumentException("The numContrat argument is required");
        EntityManager em = ExportTransaction.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ExportTransaction AS o WHERE o.numTransaction = :numTransaction  AND o.numContrat = :numContrat");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ExportTransaction> q = em.createQuery(queryBuilder.toString(), ExportTransaction.class);
        q.setParameter("numTransaction", numTransaction);
        q.setParameter("numContrat", numContrat);
        return q;
    }
    
}
