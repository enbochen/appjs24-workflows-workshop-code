import { ConfigPlugin, withDangerousMod } from "@expo/config-plugins";

const withIosWidget: ConfigPlugin = (config) => {
  return withDangerousMod(config, [
    "ios",
    (dangerousConfig) => {
      console.log("iOS widget!");
      return dangerousConfig; // Return the modified config
    },
  ]);
};

export default withIosWidget;