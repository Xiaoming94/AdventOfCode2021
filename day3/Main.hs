import BinaryPowerReport

main = do
    inputReportString <- lines <$> readFile "./input.txt"
    let inputReport = map (map (read . pure :: Char -> Integer)) inputReportString
    print $ calcTemperature inputReport
