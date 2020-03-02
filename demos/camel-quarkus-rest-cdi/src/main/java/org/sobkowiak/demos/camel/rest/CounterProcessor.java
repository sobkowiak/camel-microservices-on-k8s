package org.sobkowiak.demos.camel.rest;

import io.quarkus.runtime.annotations.RegisterForReflection;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.inject.Named;


@ApplicationScoped
@Named("counterProcessor")
@RegisterForReflection
public class CounterProcessor {

  @Inject
  Counter counter;

  public String processMessage(String message) {
    return String.format("%s (%s)", message, counter.increment());
  }
}
