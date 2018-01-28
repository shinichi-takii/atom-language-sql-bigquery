# TODO: append test codes

describe "BigQuery SQL grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-sql-bigquery")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.sql-bigquery")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.sql-bigquery"
