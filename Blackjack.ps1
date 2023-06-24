using module ./Modules/cards.psm1
$player1 = [Cards]::new('Player 1')
$Dealer = [Cards]::new('Dealer')

$deck = [Cards]::new('Deck')
$deck.NewDeck()
$deck.Shuffle()

# Deal two hands
$player1 | Update-List -Property cards -Add $deck.cards[0,2] | Out-Null
$Dealer | Update-List -Property cards -Add $deck.cards[1,3] | Out-Null
$deck | Update-List -Property cards -Remove $Dealer.cards | Out-Null
$deck | Update-List -Property cards -Remove $player1.cards | Out-Null

$player1.Show()
Write-Host "Dealer :::: $($Dealer.cards[0]) [x]"
$deck.Show()

$deck = $null