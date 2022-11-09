const { exec } = require(`child_process`);

const abort = (code) => {
  exec(`abort ${code}`);
};
