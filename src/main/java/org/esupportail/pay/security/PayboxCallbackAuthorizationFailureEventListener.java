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
package org.esupportail.pay.security;

import org.jboss.logging.Logger;
import org.springframework.context.event.EventListener;
import org.springframework.security.access.event.AuthorizationFailureEvent;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Service;

@Service
public class PayboxCallbackAuthorizationFailureEventListener {

	private final Logger log = Logger.getLogger(getClass());

	@EventListener
	public void authorizationFailureEventCatch(AuthorizationFailureEvent authorizationFailureEvent) {

		if(authorizationFailureEvent.getSource() instanceof FilterInvocation) {
			FilterInvocation filterInvocation = (FilterInvocation) authorizationFailureEvent.getSource();
			if("/payboxcallback".equals(filterInvocation.getHttpRequest().getRequestURI())) {
				log.warn("payboxcallback from IP " + filterInvocation.getHttpRequest().getRemoteAddr() + " failed because authorizationFailure on spring security filter");
				log.debug("filterInvocation : "  + filterInvocation);
			}
		}

	}

}
