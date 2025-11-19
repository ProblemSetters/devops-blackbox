#!/usr/bin/env bash
java -jar /usr/local/bin/jenkins-cli.jar install-plugin pipeline-model-definition -deploy || java -jar /usr/local/bin/jenkins-cli.jar install-plugin pipeline-model-definition -deploy # 2nd is CI fix
java -jar /usr/local/bin/jenkins-cli.jar create-job test-job <<EOF
<?xml version="1.1" encoding="UTF-8"?>
<flow-definition plugin="workflow-job">
  <keepDependencies>false</keepDependencies>
  <properties/>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition" plugin="workflow-cps">
    <script>
        pipeline {
            agent any
            stages {
                stage("test") {
                    steps {
                        echo "test stage is done"
                    }
                }
            }
        }
    </script>
    <sandbox>true</sandbox>
  </definition>
  <triggers/>
  <disabled>false</disabled>
</flow-definition>
EOF
java -jar /usr/local/bin/jenkins-cli.jar build test-job -v -s
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
