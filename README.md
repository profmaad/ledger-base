ledger-base
===========

Basic tools for working with the ledger accounting system in ruby

Requirements
============

* trollop >= 2.0
* deep_merge >= 1.0

Available tools
===============

LedgerBase::CSVParser
---------------------
This module is able to parse the csv as returned from ```ledger csv```.
It will extract all available data, including metadata (both key-value and tags) and return these as ruby hashes.

LedgerBase::Command
-------------------
This module contains a method to assemble the correct base command to call ledger, using the information specified in the ledger-base config file (see LedgerBase::Config).

LedgerBase::Transactions
------------------------
This module contains a method to execute a query against ledger and get the (chronologically) last matching transaction as a ruby hash.

LedgerBase::Options
-------------------
This module includes a trollop-based command line option parser to extract the options that are handled by ledger-base.

LedgerBase::Config
------------------
This class handles the ledger-base config and allows access to it for other parts of ledger-base and other software using it.


Copyright & License
===================
The MIT License (MIT)

Copyright (c) 2014 Maximilian Wolter

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
