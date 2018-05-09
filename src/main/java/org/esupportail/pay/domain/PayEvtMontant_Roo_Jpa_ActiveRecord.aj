/**
 * Licensed to ESUP-Portail under one or more contributor license
 * agreements. See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.
 *
 * ESUP-Portail licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.esupportail.pay.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.esupportail.pay.domain.PayEvtMontant;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PayEvtMontant_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PayEvtMontant.entityManager;
    
    public static final List<String> PayEvtMontant.fieldNames4OrderClauseFilter = java.util.Arrays.asList("evt", "title", "description", "help", "field1Label", "field2Label", "dbleMontant", "urlId", "freeAmount", "sciencesconf", "addPrefix", "optionalAddedParams");
    
    public static final EntityManager PayEvtMontant.entityManager() {
        EntityManager em = new PayEvtMontant().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PayEvtMontant.countPayEvtMontants() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PayEvtMontant o", Long.class).getSingleResult();
    }
    
    public static List<PayEvtMontant> PayEvtMontant.findAllPayEvtMontants() {
        return entityManager().createQuery("SELECT o FROM PayEvtMontant o", PayEvtMontant.class).getResultList();
    }
    
    public static List<PayEvtMontant> PayEvtMontant.findAllPayEvtMontants(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PayEvtMontant o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PayEvtMontant.class).getResultList();
    }
    
    public static PayEvtMontant PayEvtMontant.findPayEvtMontant(Long id) {
        if (id == null) return null;
        return entityManager().find(PayEvtMontant.class, id);
    }
    
    public static List<PayEvtMontant> PayEvtMontant.findPayEvtMontantEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PayEvtMontant o", PayEvtMontant.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PayEvtMontant> PayEvtMontant.findPayEvtMontantEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PayEvtMontant o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PayEvtMontant.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PayEvtMontant.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PayEvtMontant.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PayEvtMontant attached = PayEvtMontant.findPayEvtMontant(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PayEvtMontant.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PayEvtMontant.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PayEvtMontant PayEvtMontant.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PayEvtMontant merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
