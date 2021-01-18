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
package org.esupportail.pay.domain;
import java.util.ArrayList;
import java.util.List;
import java.util.SortedMap;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.esupportail.pay.domain.Label.LOCALE_IDS;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.transaction.annotation.Transactional;

import lombok.Getter;
import lombok.Setter;

@Entity
@Configurable
@Getter
@Setter
public class PayEvt {

	public static final List<String> fieldNames4OrderClauseFilter = java.util.Arrays.asList("id", "logoFile", "payboxServiceKey", "title", "webSiteUrl", "urlId", "managersEmail", "mailSubject", "payboxCommandPrefix", "respLogins", "viewerLogins", "defaultMntDescription", "logins", "viewerLogins2Add");

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;
	
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private BigFile logoFile = new BigFile();

    @NotEmpty
    String payboxServiceKey;
    
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    Label title;

    String webSiteUrl;

    @Column(unique = true)
    String urlId;

    @NotEmpty
    String managersEmail;
    
    @NotEmpty
    String mailSubject;

    @NotEmpty
    String payboxCommandPrefix;

    @ManyToMany
    List<RespLogin> respLogins;

    @ManyToMany
    List<RespLogin> viewerLogins;
    
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    Label defaultMntDescription;
    
    String defaultOptionalAddedParams = "";
    
    Double dbleMontantMax;
    
    /**
     * pour formulaire web
     */
    @Transient
    List<String> logins;
    
    
    /**
     * pour formulaire web
     */
    @Transient
    List<String> viewerLogins2Add;
    
    public PayEvt() {
		super();
		title = new Label();
		defaultMntDescription = new Label();
		defaultMntDescription.getLabelLocales().get(LOCALE_IDS.fr.toString()).setTranslation("Droits d'inscriptions");
		defaultMntDescription.getLabelLocales().get(LOCALE_IDS.en.toString()).setTranslation("Registration fees");
	}

	public String getRespLoginsStr() {
        List<String> displayNames = new ArrayList<>();
        for (RespLogin respLogin : respLogins) {
        	if(respLogin.getDisplayName() != null) {
        		displayNames.add(respLogin.getDisplayName());
        	} else {
        		displayNames.add(respLogin.getLogin());
        	}
        }
        return StringUtils.join(displayNames, " ; ");
    }
    
    public String getViewerLoginsStr() {
        List<String> displayNames = new ArrayList<>();
        for (RespLogin viewerLogin : viewerLogins) {
        	if(viewerLogin.getDisplayName() != null) {
        		displayNames.add(viewerLogin.getDisplayName());
        	} else {
        		displayNames.add(viewerLogin.getLogin());
        	}
        }
        return StringUtils.join(displayNames, " ; ");
    }
 
    public List<String> getLogins() {
		if(logins==null && respLogins!=null) {
			this.logins = new ArrayList<String>();
			for(RespLogin respLogin: respLogins) {
				this.logins.add(respLogin.getLogin());
			}
		}
		return this.logins;
	}

	public List<String> getViewerLogins2Add() {
		if(viewerLogins2Add==null && viewerLogins!=null) {
			this.viewerLogins2Add = new ArrayList<String>();
			for(RespLogin viewerLogin: viewerLogins) {
				this.viewerLogins2Add.add(viewerLogin.getLogin());
			}
		}
		return viewerLogins2Add;
	}
    
    public String getTitleFr() {
    	return this.getTitle().getTranslation(LOCALE_IDS.fr);
    }

}
