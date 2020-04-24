using DataFrames
using CSV
using Random

@enum db_type output csv

mutable struct dbEngine
    id::String
    type:: db_type
    log:: Bool
    rows_df:: DataFrames.DataFrame
    results:: DataFrames.DataFrame
    meta :: Dict{String,String}
end

function db()
    id = randstring(12)
    return dbEngine(id, output,true, DataFrame(), DataFrame(), Dict())
end

function meta(db::dbEngine, key::String, value::String)
    push!(db.meta, (key => value))
end
# Note that constructing a DataFrame row by row is significantly less performant than constructing it all at once, or column by column. For many use-cases this will not matter, but for very large DataFrames this may be a consideration.
function setup(db::dbEngine)
    @debug "DB is setupped."
end

function finish(db::dbEngine)
    @debug "DB is finished."
    dbSaveData(db)
end

function store(db::dbEngine)
    date_format = Dates.format(now(), "yymmddHHMMSS_s")
    id = db.id
    CSV.write("results/rows.csv", db.rows_df, append=true)
    CSV.write("results/results.csv", db.results, append=true)
end

function info(db::dbEngine, text, data)
    @debug text data...
end

function record(db::dbEngine, data)
    info(db, "New row is inserted.", data )
    push!(db.rows_df, data)
end

function result(db::dbEngine, data)
    @debug "Result" data...
    push!(db.results, data)
end
