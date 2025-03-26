# Usar uma imagem oficial do Python
FROM python:3.9-slim

# Criar o usuário 1001 e configurar permissões
RUN useradd -m -u 1001 flaskuser

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos da aplicação para o contêiner
COPY . /app

# Alterar o proprietário para o usuário 1001
RUN chown -R flaskuser:flaskuser /app

# Alternar para o usuário 1001
USER 1001

# Instalar dependências do Flask
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta que o Flask usará
EXPOSE 8080

ENV MESSAGE="test"

# Comando para rodar o Flask
CMD ["python", "app.py"]
