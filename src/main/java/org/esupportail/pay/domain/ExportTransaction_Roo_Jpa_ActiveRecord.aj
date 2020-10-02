// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.esupportail.pay.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.esupportail.pay.domain.ExportTransaction;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExportTransaction_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ExportTransaction.entityManager;
    
    public static final List<String> ExportTransaction.fieldNames4OrderClauseFilter = java.util.Arrays.asList("numTransaction", "transactionDate", "dateRemise", "numContrat", "reference", "montant", "statut", "email");
    
    public static final EntityManager ExportTransaction.entityManager() {
        EntityManager em = new ExportTransaction().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExportTransaction.countExportTransactions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ExportTransaction o", Long.class).getSingleResult();
    }
    
    public static List<ExportTransaction> ExportTransaction.findAllExportTransactions() {
        return entityManager().createQuery("SELECT o FROM ExportTransaction o", ExportTransaction.class).getResultList();
    }
    
    public static List<ExportTransaction> ExportTransaction.findAllExportTransactions(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExportTransaction o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExportTransaction.class).getResultList();
    }
    
    public static ExportTransaction ExportTransaction.findExportTransaction(Long id) {
        if (id == null) return null;
        return entityManager().find(ExportTransaction.class, id);
    }
    
    public static List<ExportTransaction> ExportTransaction.findExportTransactionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ExportTransaction o", ExportTransaction.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ExportTransaction> ExportTransaction.findExportTransactionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExportTransaction o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExportTransaction.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ExportTransaction.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExportTransaction.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExportTransaction attached = ExportTransaction.findExportTransaction(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExportTransaction.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ExportTransaction.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ExportTransaction ExportTransaction.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExportTransaction merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
