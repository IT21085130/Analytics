select *
from PortfolioProject.dbo.CovidDeaths
order by 3,4

select *
from PortfolioProject.dbo.CovidVaccinations
order by 3,4

select *
from PortfolioProject.dbo.CovidDeaths$_xlnm#_FilterDatabase
order by 3,4

--select data that we are going to be using
select location, date, total_cases, new_cases, total_deaths
from PortfolioProject.dbo.CovidDeaths


--looking at total cases vs total deaths
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as 'death percentage'
from PortfolioProject.dbo.CovidDeaths
where location like 'Sri Lanka'
order by [death percentage] desc

--looking at total cases vs population
select location, date, total_cases,population,(total_cases/population)*100 as 'cases percentage'
from PortfolioProject.dbo.CovidDeaths
where location like 'Sri Lanka'
order by date

--looking at countries which has highest infection rate compaired to population

--infection rate here is considering all the infected cases
select location,population,SUM(total_cases)as 'total cases', (SUM(total_cases)/population)*100 as 'infection_rate'
from PortfolioProject.dbo.CovidDeaths
group by location,population
order by infection_rate desc

--infection rate is considered here by getting the maximum count of each country cases
select location,population,max(total_cases) as 'HighestInfectionCount' , max((total_cases/population)*100) as 'HighestInfectionRate'
from PortfolioProject.dbo.CovidDeaths
group by location,population
order by HighestInfectionRate desc

--looking at sri lanka's infection rate
select location,population,SUM(total_cases)as 'total cases', (SUM(total_cases)/population)*100 as 'infection_rate'
from PortfolioProject.dbo.CovidDeaths
where location like 'Sri Lanka'
group by location,population

--showing countries with the highest death count
select location , max(cast(total_deaths as int)) as HighestDeathCount
from PortfolioProject..CovidDeaths
where continent is null
group by location
order by HighestDeathCount desc 

--showing continent with total death count
select continent , sum(total_deaths) as TotalDeaths
from PortfolioProject..CovidDeaths
group by continent

select continent , max(cast(total_deaths as int))
from PortfolioProject..CovidDeaths
where continent is not null
group by continent

--total cases, deaths and percentage of people who died vs infected 
select sum(total_cases ) as totalCases , sum(cast(total_deaths as int)) as totalDeaths , sum(cast(total_deaths as int))/sum(total_cases )*100 as percentageOfDeaths
from PortfolioProject..CovidDeaths
where continent is not null


--looking at total population and total vaccination
 select dea.location , dea.date , dea.population, vac.new_vaccinations
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
on dea.date = vac.date and dea.location = vac.location
where dea.continent is not null
order by 1,2,3

--looking at no of people who vaccined in sri lanka
select date , new_vaccinations
from PortfolioProject..CovidVaccinations
where location like 'Sri Lanka'









