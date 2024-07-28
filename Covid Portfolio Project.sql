--USE CTE

--WITH POPVSVAC (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)

--AS
--(
--SELECT DEA.continent, DEA.location, DEA.date, DEA.population, VAC.new_vaccinations,
--SUM (cast(VAC.new_vaccinations as float)) OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RollingPeopleVaccinated

--FROM CovidDeaths DEA
--JOIN CovidVaccinations VAC
--   ON DEA.location = VAC.location
--   and DEA.date = VAC.date
--WHERE DEA.continent is not null AND DEA.location like 'albania'
----ORDER BY 2,3
--)

--SELECT *, (RollingPeopleVaccinated/population)*100
--FROM POPVSVAC

--DROP TABLE IF EXISTS #PercentPeopleVaccinated 
--CREATE TABLE #PercentPeopleVaccinated 

--(
--continent varchar(255),
--location varchar (255),
--date DATETIME,
--population FLOAT,
--new_vaccinations FLOAT,
--RollingPeopleVaccinated INT
--)

--INSERT INTO #PercentPeopleVaccinated

--SELECT DEA.continent, DEA.location, DEA.date, DEA.population, VAC.new_vaccinations,
--SUM (cast(VAC.new_vaccinations as float)) OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RollingPeopleVaccinated

--FROM CovidDeaths DEA
--JOIN CovidVaccinations VAC
--   ON DEA.location = VAC.location
--   and DEA.date = VAC.date
--WHERE DEA.location like 'ARG%'
----ORDER BY 2,3

--SELECT *, (RollingPeopleVaccinated/population)*100
--FROM #PercentPeopleVaccinated


-- Creating View to store data for later visualizations

CREATE VIEW PercentPeopleVaccinated AS

SELECT DEA.continent, DEA.location, DEA.date, DEA.population, VAC.new_vaccinations,
SUM (cast(VAC.new_vaccinations as float)) OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RollingPeopleVaccinated
FROM CovidDeaths DEA
JOIN CovidVaccinations VAC
ON DEA.location = VAC.location
and DEA.date = VAC.date
WHERE DEA.location like 'ARG%'
--ORDER BY 2,3

SELECT*
FROM PercentPeopleVaccinated