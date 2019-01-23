pipeline {
  agent { label 'headless-demo' }
  stages {
    stage('Build') {
      steps {
        sh 'bundle exec rake sauce_demo'
      }
    }
  }
}