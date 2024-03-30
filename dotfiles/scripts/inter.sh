#!/bin/zsh

# Função para buscar dados usando curl e acessar o campo "disponivel" usando jq
fetch_and_display_notification() {
	# Executa o comando curl para buscar os dados
	response=$(curl -sS 'https://cd.web.bancointer.com.br/ib-pfj/saldo/v3' \
		-H 'accept: application/json, text/plain, */*' \
		-H 'accept-language: pt-BR,pt;q=0.5' \
		-H 'authorization: bearer 4ce10300-4c3d-4b6f-8ab2-79d22df08647' \
		-H 'origin: https://contadigital.inter.co' \
		-H 'sec-ch-ua: "Brave";v="123", "Not:A-Brand";v="8", "Chromium";v="123"' \
		-H 'sec-ch-ua-mobile: ?0' \
		-H 'sec-ch-ua-platform: "Linux"' \
		-H 'sec-fetch-dest: empty' \
		-H 'sec-fetch-mode: cors' \
		-H 'sec-fetch-site: cross-site' \
		-H 'sec-gpc: 1' \
		-H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36' \
		-H 'x-inter-organization: IBPF' \
		-H 'x-origin-dvice: WEB')

	# Acessa o campo "saldo" usando jq e exibe o resultado
	saldo=$(echo "$response" | jq -r '.disponivel')

	# Exibe o saldo usando notify-send
	notify-send "Saldo Disponível" "Seu saldo atual é de: R$ $saldo"
}

# Chama a função para buscar dados e exibir a notificação
fetch_and_display_notification
