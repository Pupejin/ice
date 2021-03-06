// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spring.domain;

import com.spring.domain.Lab;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Lab_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Lab.entityManager;
    
    public static final List<String> Lab.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name");
    
    public static final EntityManager Lab.entityManager() {
        EntityManager em = new Lab().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Lab.countLabs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Lab o", Long.class).getSingleResult();
    }
    
    public static List<Lab> Lab.findAllLabs() {
        return entityManager().createQuery("SELECT o FROM Lab o", Lab.class).getResultList();
    }
    
    public static List<Lab> Lab.findAllLabs(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Lab o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Lab.class).getResultList();
    }
    
    public static Lab Lab.findLab(Long id) {
        if (id == null) return null;
        return entityManager().find(Lab.class, id);
    }
    
    public static List<Lab> Lab.findLabEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Lab o", Lab.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Lab> Lab.findLabEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Lab o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Lab.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Lab.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Lab.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Lab attached = Lab.findLab(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Lab.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Lab.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Lab Lab.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Lab merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
