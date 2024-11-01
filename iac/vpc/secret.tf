resource "kubernetes_secret" "ssh_secret" {
  metadata {
    name      = "ssh-credentials"
    namespace = "plataforma" 
  }
  data = {
    SSH_KEY = base64encode("ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNe2ssjNCI9HGETKmLMEa8hU929J9Qob5+3XA5aNsRT2m656Eb9gCq4ylFDhGaMhjn6aHZogZFNxScDfamMWAveDggoxN6VhNa2XqUTWyMTmXmburxXFEK237L6hBlEF2skxiqmhEhs6Ca4F20MW+KTvpBWt0bTGmRFMjF31s7HaEaVFYpXcmUiay9AsM8Qhq19uWBe9Rho45oPcwv/QYGMnHCdGMiNTrhrJLBpWAz3LPvSyRTQ0go49SkBLefyjzq4fC/WJ/PakXdPBfTsEB9SuhA4eJuSWcyi3xDfb9j2uIRZU39frhGFJ6MEW7Mth+RYbE3CP1xlw1105aUWOsgAvVTNTtVL1wuZyjIi6LSecGOTnKBb5Ff3vrQLvHgxlfN4IKkYqxIX4Tsyz3aFQ4G/50JfG7fuBDRYXAiY1itpwLzqAafo5bLwJg3oPUY3w1lQn8XzhpqYaoiqCdTw7CSG6YSKyz4q/fEUwrx/8vR0LJ7Y2ALvBb+xPVrOrYSOEYRRIw+kk6Ll+IZcX2MCjjMpUc6jZoPCM7wCn5+rCAzphcBLXatGLFnCK3I03C//WVc2cE5MwObmUg0NE6VXV+TCtb/+NvanRLgXEUOlsowSSZMWKMLXZ2VUV3HrR4OpEao1OWjZlSArgjeydbS15Aus3jp9KJiEN9RLFTASnecrw== mateus@pop-os") 
  }
}