let
  region = "us-west-1";
  accessKeyId = "ec2-agam";

in
{
  festhest =
    { resources, ... }:
    {
      deployment.targetEnv = "ec2";
      deployment.ec2.accessKeyId = accessKeyId;
      deployment.ec2.region = region;
      deployment.ec2.instanceType = "t2.micro";
      deployment.ec2.keyPair = resources.ec2KeyPairs.festhest-keys;
    };

    resources.ec2KeyPairs.festhest-keys =
      { inherit region accessKeyId; };
}
