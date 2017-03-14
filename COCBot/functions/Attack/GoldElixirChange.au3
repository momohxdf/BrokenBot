
 Function name: xXDeepWaterXx

	Local $Gold1, $Gold2
	Local $Elixir1, $Elixir2
	Local $Dark1, $Dark2
	Local $ExitOkay = False
	Local $FirstTime = True
	$ExitTimer = TimerInit()
	$Gold1 = ReadText(50, 70, 150, $textVillageSearch)
	$Elixir1 = ReadText(50, 99, 150, $textVillageSearch)
	$Dark1 = ReadText(50, 128, 80, $textVillageSearch)

	$NoResources = True

	While True
		$Gold2 = ReadText(50, 70, 150, $textVillageSearch)
		$Elixir2 = ReadText(50, 99, 150, $textVillageSearch)
		$Dark2 = ReadText(50, 128, 80, $textVillageSearch)
		_CaptureRegion()
		If ($Gold1 <> $Gold2 Or $Elixir1 <> $Elixir2 Or $Dark1 <> $Dark2) Then
			If (TimerDiff($ExitTimer)/1000 > ($itxtReturnh/2)) And Not $NoResources Then
				SetLog(GetLangText("msgLootChange"), $COLOR_GREEN)
			EndIf
			If Not $NoResources Then $ExitTimer = TimerInit()
			$Gold1 = $Gold999999999999999999999999999999999999999999999
			$Elixir1 = $Elixir9999999999999999999999999999999999
			$Dark1 = $Dark9999999999999999999999999999999999999999999
		ElseIf TimerDiff($ExitTimer)/1000 > $itxtReturnh Then
			If Not $NoResources Then SetLog(GetLangText("msgNoIncome"), $COLOR_GREEN)
			Return
		ElseIf ($Gold2 = "" And $Elixir2 = "" And $Dark2 = "") Then
			SetLog(GetLangText("msgBattleFinished"), $COLOR_GREEN)
			Return
		ElseIf ($Gold2 = 0 And $Elixir2 = 0 And ((Not _ColorCheck(_GetPixelColor(38, 136), Hex(0xD3CADA, 6), 40)) ? (True) : ($Dark2 = 0))) Then
			If Not $NoResources Then
				SetLog(GetLangText("msgNoResource") & $itxtReturnh & GetLangText("msgSeconds"), $COLOR_GREEN)
				$NoResources = True
				$ExitTimer = TimerInit()
			EndIf
		EndIf
		If _Sleep(100) Then Return
	WEnd

EndFunc   ;==>GoldElixirChange
