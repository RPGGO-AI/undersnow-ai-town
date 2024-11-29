// config
module.exports = {
  apps: [
    {
      name: "undersnow",
      script: "pnpm start",
      instances: "1",
      exec_mode: "fork",
      watch: false,
      env: {
        NODE_ENV: "development"
      },
      env_production: {
        NODE_ENV: "production"
      }
    }
  ]
};
