package org.sobkowiak.demos.camel.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class CounterProcessor {

  @Autowired
  Counter counter;

  public String processMessage(String message) {
    return  String.format("%s (%s)",   message,  counter.increment() );
  }
}
