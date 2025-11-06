-- Supabase Table Setup for Baghoor Oil Traders
-- Run this SQL in your Supabase SQL Editor to create/update the BOTs table

-- First, drop the table if it exists (CAUTION: This deletes all data!)
-- DROP TABLE IF EXISTS "BOTs";

-- Create the BOTs table with all required columns
CREATE TABLE IF NOT EXISTS "BOTs" (
    id INTEGER PRIMARY KEY,

    -- All data arrays as JSONB (supports up to 1GB per field)
    customers JSONB DEFAULT '[]'::jsonb,
    suppliers JSONB DEFAULT '[]'::jsonb,
    transactions JSONB DEFAULT '[]'::jsonb,
    payments JSONB DEFAULT '[]'::jsonb,
    expenses JSONB DEFAULT '[]'::jsonb,
    "customerTransfers" JSONB DEFAULT '[]'::jsonb,
    vehicles JSONB DEFAULT '[]'::jsonb,
    banks JSONB DEFAULT '[]'::jsonb,
    "bankTransactions" JSONB DEFAULT '[]'::jsonb,
    "rateChangeLogs" JSONB DEFAULT '[]'::jsonb,
    "ledgerEntries" JSONB DEFAULT '[]'::jsonb,
    "jvVouchers" JSONB DEFAULT '[]'::jsonb,
    "ownerAccounts" JSONB DEFAULT '[]'::jsonb,
    "systemUsers" JSONB DEFAULT '[]'::jsonb,

    -- Metadata
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE "BOTs" ENABLE ROW LEVEL SECURITY;

-- Create policy to allow all operations (since this is a single-user system)
DROP POLICY IF EXISTS "Allow all operations" ON "BOTs";
CREATE POLICY "Allow all operations" ON "BOTs"
    FOR ALL
    USING (true)
    WITH CHECK (true);

-- Insert initial empty record if it doesn't exist
INSERT INTO "BOTs" (id, customers, suppliers, transactions, payments, expenses,
                    "customerTransfers", vehicles, banks, "bankTransactions",
                    "rateChangeLogs", "ledgerEntries", "jvVouchers",
                    "ownerAccounts", "systemUsers")
VALUES (1, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb,
        '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb,
        '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;

-- Verify the table was created
SELECT * FROM "BOTs" WHERE id = 1;
