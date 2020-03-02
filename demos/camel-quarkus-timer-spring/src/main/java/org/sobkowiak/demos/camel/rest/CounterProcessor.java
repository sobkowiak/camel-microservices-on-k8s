package org.sobkowiak.demos.camel.rest;

import io.quarkus.runtime.annotations.RegisterForReflection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("counterProcessor")
@RegisterForReflection
public class CounterProcessor {

  @Autowired
  Counter counter;

  public String processMessage(String message) {
    return  String.format("%s (%s)",   message,  counter.increment() );
  }
}
