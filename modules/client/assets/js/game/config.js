
const config_items = [];
const config_tag = document.getElementById("config");

const config = config_items
  .map((config_item) => {
    return {config_item: config_tag.getAttriute(config_item)}
  })
  .reduce((acc, item) => {Object.assign(acc, item)}, {});

export default config;
