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
package org.esupportail.pay.web.admin;

import javax.annotation.Resource;

import org.esupportail.pay.dao.PayTransactionLogDaoService;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin/fees")
@Controller
@Transactional
public class PayTransactionLogController {
	
	@Resource
	PayTransactionLogDaoService payTransactionLogDaoService;
	
    @RequestMapping(produces = "text/html")
    @PreAuthorize("hasRole('ROLE_ALL_VIEWER')")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
    	if("montantDevise".equals(sortFieldName)) {
    		sortFieldName = "montant";
    	}
    	if(sortFieldName == null || sortFieldName.isEmpty()) {
    		sortFieldName = "transactionDate";
    		sortOrder = "desc";
    	}
    	if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("paytransactionlogs", payTransactionLogDaoService.findPayTransactionLogEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) payTransactionLogDaoService.countPayTransactionLogs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("paytransactionlogs", payTransactionLogDaoService.findAllPayTransactionLogs(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("listAllTxEvts", true);
        return "admin/fees-admin-view/list";
    }
    

	@RequestMapping(value = "/{id}", produces = "text/html")
    @PreAuthorize("hasPermission(#id, 'view-txlog')")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("paytransactionlog", payTransactionLogDaoService.findPayTransactionLog(id));
        uiModel.addAttribute("itemId", id);
        return "admin/fees-admin-view/show";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("payTransactionLog_transactiondate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
}

