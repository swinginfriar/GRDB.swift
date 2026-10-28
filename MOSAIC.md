# Mosaic fork of GRDB.swift

Branch `mosaic/sqlcipher-7.11.1`: upstream GRDB.swift v7.11.1 (b83108d10f42680d78f23fe4d4d80fc88dab3212) with only
`Package.swift` replaced and `Sources/GRDBSQLCipher` added, following GRDB's README "Encryption" (GRDB + SQLCipher
through SwiftPM). SQLCipher comes from https://github.com/sqlcipher/SQLCipher.swift pinned at 4.20.0.
All GRDB sources are unchanged. Tags: `v7.11.1-mosaic.N`.

To upgrade: branch from the new upstream tag, re-apply these two changes, run Mosaic's MosaicStore tests, tag.
