# BackupToStorage

Upload de arquivos de uma máquina virtual para azure storage

# Como usar

- Faça o download ou clone esse projeto em C:/ da sua máquina virtual

- Execute o script **DownloadAzCopy.ps1** para fazer o download da última versão do AzCopy [AzCopy](https://docs.microsoft.com/pt-br/azure/storage/common/storage-use-azcopy-v10)

- Configure o código em **config.json**

````JSON
[
  {
    "identity": "<virtual machine id>",
    "source": "<file to backup>",
    "container": "https://<storage-account>.blob.core.windows.net/<container>/"
  }
]
````
É uma lista de objetos como as propriedades necessárias para fazer backups:

- identity: Obtenha uma identidade gerenciada da vm

- source: Aponte o caminho do arquivo que será enviado

- container: Aponte a url do storage + container

- Execute o script **Copy.ps1**
