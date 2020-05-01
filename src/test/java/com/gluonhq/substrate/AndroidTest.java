package com.gluonhq.substrate;

import org.gradle.testkit.runner.BuildResult;
import org.gradle.testkit.runner.GradleRunner;
import org.gradle.testkit.runner.TaskOutcome;
import org.junit.jupiter.api.Test;

import java.io.File;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class AndroidTest {

    @Test
    void helloWorldTest() {
        String expected = "Hello World";
        BuildResult result = GradleRunner.create()
                .withProjectDir(new File("test-project"))
                .withArguments(":helloWorld:clean", ":helloWorld:build",
                        "-Dexpected=" + expected, "-Dsubstrate.target=android", "-Dsubstrate.step=package",
                        ":helloWorld:run", ":helloWorld:runScript", "--stacktrace")
                .forwardOutput()
                .build();

        assertEquals(TaskOutcome.SUCCESS, result.task(":helloWorld:run").getOutcome(), "Run failed!");
        assertEquals(TaskOutcome.SUCCESS, result.task(":helloWorld:runScript").getOutcome(), "RunScript failed!");
    }

    @Test
    void helloFXTest() {
        String expected = "QuantumRenderer: shutdown";
        BuildResult result = GradleRunner.create()
                .withProjectDir(new File("test-project"))
                .withArguments(":helloFX:clean", ":helloFX:build",
                        "-Dexpected=" + expected, "-Dsubstrate.target=android", "-Dsubstrate.step=package",
                        ":helloFX:runScript", "--stacktrace")
                .forwardOutput()
                .build();

        assertEquals(TaskOutcome.SUCCESS, result.task(":helloFX:runScript").getOutcome(), "RunScript failed!");
    }

    @Test
    void helloFXMLTest() {
        String expected = "QuantumRenderer: shutdown";
        BuildResult result = GradleRunner.create()
                .withProjectDir(new File("test-project"))
                .withArguments(":helloFXML:clean", ":helloFXML:build",
                        "-Dexpected=" + expected, "-Dsubstrate.target=android", "-Dsubstrate.step=package",
                        ":helloFXML:runScript", "--stacktrace")
                .forwardOutput()
                .build();

        assertEquals(TaskOutcome.SUCCESS, result.task(":helloFXML:runScript").getOutcome(), "RunScript failed!");
    }

    @Test
    void helloGluonTest() {
        String expected = "QuantumRenderer: shutdown";
        BuildResult result = GradleRunner.create()
                .withProjectDir(new File("test-project"))
                .withArguments(":helloGluon:clean", ":helloGluon:build", "-Dsubstrate.step=package",
                        "-Dexpected=" + expected, "-Dsubstrate.target=android",
                        ":helloGluon:runScript", "--stacktrace")
                .forwardOutput()
                .build();

        assertEquals(TaskOutcome.SUCCESS, result.task(":helloGluon:runScript").getOutcome(), "RunScript failed!");
    }
}
