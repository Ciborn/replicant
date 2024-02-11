{ }:

{
  mkContainer = {
    ip,
  }: config: {
    # meta
    autoStart = true;

    # networking
    hostBridge = "br0";
    localAddress6 = "${ip}/16";
    privateNetwork = true;
  } // config;
}
