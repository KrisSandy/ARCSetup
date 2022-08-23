#!/bin/bash

az provider register --namespace Microsoft.Kubernetes
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.ExtendedLocation

az group delete --name AzureArcTest --location northeurope
az group create --name AzureArcTest --location northeurope --output table

az connectedk8s connect --name AzureArcTest1 --resource-group AzureArcTest
