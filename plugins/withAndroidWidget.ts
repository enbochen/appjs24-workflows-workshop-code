import { ConfigPlugin, withDangerousMod } from "@expo/config-plugins";

const withAndroidWidget: ConfigPlugin = (config) => {
  return withDangerousMod(config, [
    "android",
    (dangerousConfig) => {
      console.log("Android widget!");
      return dangerousConfig;
    },
  ]);
};

export default withAndroidWidget;