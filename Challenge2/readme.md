Challenge #2 Question:

We need to write code that will query the meta data of an instance within AWS and provide a json formatted output. The choice of language and implementation is up to you.
Bonus Points
The code allows for a particular data key to be retrieved individually
Hints
·         Aws Documentation (https://docs.aws.amazon.com/)
·         Azure Documentation (https://docs.microsoft.com/en-us/azure/?product=featured)
·         Google Documentation (https://cloud.google.com/docs)

Solution: 
I have created for Azure Cloud to get instance metadata, when the challenge2.sh is executed in the Azure VM we will get the metadata of the instance. And the script will also ask for a data key in the metadata which will fetch the value of the data reqested 

Output:

when executed we will get the result as mentioned below
sh challenge2.sh

{
  "compute": {
    "azEnvironment": "AzurePublicCloud",
    "customData": "",
    "evictionPolicy": "",
    "isHostCompatibilityLayerVm": "false",
    "licenseType": "",
    "location": "westeurope",
    "name": "XXX",
    "offer": "CentOS",
    "osProfile": {
      "adminUsername": "XXX",
      "computerName": "XXX",
      "disablePasswordAuthentication": "false"
    },
    "osType": "Linux",
    "placementGroupId": "",
    "plan": {
      "name": "",
      "product": "",
      "publisher": ""
    },
    "platformFaultDomain": "0",
    "platformUpdateDomain": "0",
    "priority": "",
    "provider": "Microsoft.Compute",
    "publicKeys": [],
    "publisher": "OpenLogic",
    "resourceGroupName": "XXX",
    "resourceId": "XXX",
    "securityProfile": {
      "secureBootEnabled": "false",
      "virtualTpmEnabled": "false"
    },
    "sku": "8_2",
    "storageProfile": {
      "dataDisks": [],
      "imageReference": {
        "id": "",
        "offer": "CentOS",
        "publisher": "OpenLogic",
        "sku": "8_2",
        "version": "latest"
      },
      "osDisk": {
        "caching": "ReadWrite",
        "createOption": "FromImage",
        "diffDiskSettings": {
          "option": ""
        },
        "diskSizeGB": "64",
        "encryptionSettings": {
          "enabled": "false"
        },
        "image": {
          "uri": ""
        },
        "managedDisk": {
          "id": "XXX",
          "storageAccountType": "Standard_LRS"
        },
        "name": "XXX",
        "osType": "Linux",
        "vhd": {
          "uri": ""
        },
        "writeAcceleratorEnabled": "false"
      },
      "resourceDisk": {
        "size": "38912"
      }
    },
    "subscriptionId": "XXX",
    "tags": "",
    "tagsList": [
      {
        "name": "App Id",
        "value": "NA"
      }
    ],
    "userData": "",
    "version": "8.2.2020062400",
    "vmId": "XXX",
    "vmScaleSetName": "",
    "vmSize": "Standard_B2s",
    "zone": ""
  },
  "network": {
    "interface": [
      {
        "ipv4": {
          "ipAddress": [
            {
              "privateIpAddress": "10.0.1.5",
              "publicIpAddress": "XXX"
            }
          ],
          "subnet": [
            {
              "address": "10.0.1.0",
              "prefix": "24"
            }
          ]
        },
        "ipv6": {
          "ipAddress": []
        },
        "macAddress": "000D3A27E82C"
      }
    ]
  }
}
Enter any data key to retrieve value: macAddress
000D3A27E82C

