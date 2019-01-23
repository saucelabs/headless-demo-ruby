pipeline {
  agent { label 'headless-demo' }
  stages {
    stage('Setup') {
      steps {
        sh 'bundle install'
      }
    }
    stage('Build') {
      steps {
        sh 'bundle exec rake sauce_demo'
      }
    }
  }
}