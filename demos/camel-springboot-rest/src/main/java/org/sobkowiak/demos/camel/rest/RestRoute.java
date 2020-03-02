/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sobkowiak.demos.camel.rest;

import org.apache.camel.builder.endpoint.EndpointRouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class RestRoute extends EndpointRouteBuilder {

  @Value("${hello.message}")
  String mesage;

  @Autowired
  CounterProcessor counterProcessor;

  @Override
  public void configure() throws Exception {

    restConfiguration().contextPath("/api").apiContextPath("/api-doc")
      .apiProperty("api.title", "Camel REST API")
      .apiProperty("api.version", "1.0")
      .apiProperty("cors", "true")
      .apiContextRouteId("doc-api")
      .port("8080")
      .bindingMode(RestBindingMode.json);

    rest().description("Hello REST Service")
      .get("/hello")
      .description("Say Hello").outType(String.class)
      .route().routeId("hello-api")
      .to(direct("hello"));

    from(direct("hello"))
      .transform().constant(mesage)
      .bean(counterProcessor)
      .to(log("demo").showExchangePattern(false).showBodyType(false));

  }

}
