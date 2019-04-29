<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var websocket = new WebSocket("ws://localhost:8080/DevelopmentManagementSystem/chatroomServerEndpoint");
			websocket.onmessage = function processMessage(message) {
				var jsonData = JSON.parse(message.data);
				if(jsonData.message != null) messageTextArea.value += jsonData.message + "\n";
			}
			function sendMessage() {
				websocket.send(messageText.value);
				messageText.value = "";
			}
		</script>
	</head>
	
	<body>
	
		<textarea id="messageTextArea" readonly="readonly" rows="10" cols="45"></textarea><br>
		<input type="text" id="messageText" size="50"/><input type="button" value="Send" onclick="sendMessage();"/>

	</body>
	
</html>