# Set up a public/private key
```
ssh-keygen -t rsa -b 4096 -C "<your@email.com>"
```
Follow the prompts.

Save the key as a different filename.

Set a passphrase for better security.

Set public/private key permissions.

```
chmod 400 /home/admin/.ssh/id_rsa*
```

# Switch SSH Identities
```
ssh-add ~/.ssh/id_rsa<your custom key>
```