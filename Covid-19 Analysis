SELECT *
FROM Cov19..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3, 4


SELECT Location, date, population, total_cases, new_cases, total_deaths
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2

SELECT Location, date, population, total_cases, new_cases, total_deaths
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
AND location = 'Bangladesh'
ORDER BY 1, 2

--Shows death ration

SELECT Location, date, total_cases, total_deaths
, (total_deaths/total_cases)*100 as Death_Percentage
FROM cov19..CovidDeaths
WHERE location = 'Bangladesh'
AND continent IS NOT NULL
ORDER BY 1, 2

SELECT Location, SUM(cast(total_cases as int)) AS Tota_Cases
, SUM(cast(total_deaths as int)) AS Total_Deaths
, (SUM(cast(total_deaths as int))/SUM(total_cases))*100 as Death_Percentage
FROM cov19..CovidDeaths
WHERE location = 'Bangladesh'
AND continent IS NOT NULL
GROUP BY location


--Shows what percentages got infected

SELECT Location, date total_cases, population, (total_cases/population)*100 as Percent_Population_Infected
FROM cov19..CovidDeaths
WHERE location = 'Bangladesh'
AND continent IS NOT NULL
ORDER BY 1, 2

--Shows countries with highest infection rate

SELECT Location, MAX(total_cases) AS Highest_Infectin_Count, population
, MAX(total_cases/population)*100 as Percent_Population_Infected
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Percent_Population_Infected DESC

--Shows countries with highest death count

SELECT Location, MAX(CAST(total_deaths AS int)) AS Total_Death_Count
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY Total_Death_Count DESC

--Shows continents with highest death count

SELECT continent, MAX(CAST(total_deaths AS int)) AS Total_Death_Count
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Total_Death_Count DESC


--Global Number


SELECT date, SUM(new_cases) AS Total_Cases, SUM(CAST(new_deaths as int)) AS Total_Deaths
, SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 as Death_Percentage
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1, 2

SELECT SUM(new_cases) AS Total_Cases, SUM(CAST(new_deaths as int)) AS Total_Deaths, SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 as Death_Percentage
FROM cov19..CovidDeaths
WHERE continent IS NOT NULL


--Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location
, dea.date ) AS Rolling_People_Vaccinated
FROM Cov19..CovidDeaths dea
JOIN Cov19..CovidVaccinations vac
     ON dea.location = vac.location
	 and dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3


--USE CTE

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, Rolling_People_Vaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location
, dea.date ) AS Rolling_People_Vaccinated
FROM Cov19..CovidDeaths dea
JOIN Cov19..CovidVaccinations vac
     ON dea.location = vac.location
	 and dea.date = vac.date
WHERE dea.continent IS NOT NULL

)
SELECT *, (Rolling_People_Vaccinated/Population)*100 AS Percent_Rol_P_Vac
FROM PopvsVac
