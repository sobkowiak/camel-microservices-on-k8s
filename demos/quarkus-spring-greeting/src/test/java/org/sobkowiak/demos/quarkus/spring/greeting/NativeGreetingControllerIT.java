package org.sobkowiak.demos.quarkus.spring.greeting;

import io.quarkus.test.junit.NativeImageTest;

@NativeImageTest
public class NativeGreetingControllerIT extends GreetingControllerTest {

    // Execute the same tests but in native mode.
}