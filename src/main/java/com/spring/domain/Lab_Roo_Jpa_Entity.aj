// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spring.domain;

import com.spring.domain.Lab;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Lab_Roo_Jpa_Entity {
    
    declare @type: Lab: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Lab.id;
    
    @Version
    @Column(name = "version")
    private Integer Lab.version;
    
    public Long Lab.getId() {
        return this.id;
    }
    
    public void Lab.setId(Long id) {
        this.id = id;
    }
    
    public Integer Lab.getVersion() {
        return this.version;
    }
    
    public void Lab.setVersion(Integer version) {
        this.version = version;
    }
    
}
