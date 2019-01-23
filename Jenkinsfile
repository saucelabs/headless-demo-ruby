pipeline {
  agent { label 'headless-demo' }
  stages {
    stage('Build') {
      steps {
        sh 'bundle exec rake -j12 sauce_demo'
      }
    }
  }
}