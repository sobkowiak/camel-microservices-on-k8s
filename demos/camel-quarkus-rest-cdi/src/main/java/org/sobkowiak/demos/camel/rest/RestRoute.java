package org.sobkowiak.demos.camel.rest;

import org.apache.camel.builder.endpoint.EndpointRouteBuilder;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;


@ApplicationScoped
public class RestRoute extends EndpointRouteBuilder {

  @ConfigProperty(name = "hello.message")
  String mesage;

  @Inject
  CounterProcessor counterProcessor;


  @Override
  public void configure() throws Exception {

    restConfiguration().contextPath("/api")
      .port("8080")
      .bindingMode(org.apache.camel.model.rest.RestBindingMode.json);

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
