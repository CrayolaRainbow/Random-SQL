select 
	PredGame.GameID, predGame.Team, predGame.Year, predGame.Date, predGame.Time, predGame.`G#`, prevGame.`G#`, avg(prevGames.PF) avgPF, count(*)
from 
	nfldata predGame inner join
    nfldata prevGames on predGame.Tm=prevGames.Tm and
		predGame.Year=prevGames.Year
where
	prevGame.`G#` < predGame.`G#` between 1 and 4
group by 
	predGame.GameID, predGame.Team, predGame.Year, predGame.Date, predGame.Time, predGame.`G#`, prevGame.`G#`
