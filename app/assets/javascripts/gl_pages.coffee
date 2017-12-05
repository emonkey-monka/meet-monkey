# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
	successCallback = (position) ->
		# 位置情報が渡ってくる
		data = position.coords
		# データの整理
		lat = data.latitude
		document.getElementById('lat').innerHTML = lat
		lng = data.longitude
		document.getElementById('lng').innerHTML = lng
		accLatlng = data.accuracy
		document.getElementById('accLatlng').innerHTML = accLatlng

	errorCallback = (errors) ->
		# エラー処理
		# エラー番号に対応したメッセージ
		errorInfo = [
			"原因不明のエラーが発生しました。"
			"位置情報の取得が許可されませんでした。"
			"電波状況などで位置情報が取得できませんでした。"
			"位置情報の取得に時間がかかり過ぎてタイムアウトしました。"
		]
		# エラー番号
		errorNo = error.code
		# エラーメッセージ
		errorMessage = "[エラー番号: " + errorNo + "]\n" + errorInfo[errorNo]
		# アラート表示
		alert errorMessage
		# HTMLに書き出し
		document.getElementById('result').innerHTML = errorMessage

	navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
