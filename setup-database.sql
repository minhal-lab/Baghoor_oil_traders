-- ========================================
-- Baghoor Oil Traders - Database Setup
-- Run this in Supabase SQL Editor
-- ========================================

-- Create BOTs table for all business data
CREATE TABLE IF NOT EXISTS "BOTs" (
    id INTEGER PRIMARY KEY DEFAULT 1,
    customers JSONB DEFAULT '[]'::jsonb,
    suppliers JSONB DEFAULT '[]'::jsonb,
    transactions JSONB DEFAULT '[]'::jsonb,
    payments JSONB DEFAULT '[]'::jsonb,
    expenses JSONB DEFAULT '[]'::jsonb,
    customerTransfers JSONB DEFAULT '[]'::jsonb,
    vehicles JSONB DEFAULT '[]'::jsonb,
    banks JSONB DEFAULT '[]'::jsonb,
    bankTransactions JSONB DEFAULT '[]'::jsonb,
    rateChangeLogs JSONB DEFAULT '[]'::jsonb,
    ledgerEntries JSONB DEFAULT '[]'::jsonb,
    jvVouchers JSONB DEFAULT '[]'::jsonb,
    systemUsers JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE "BOTs" ENABLE ROW LEVEL SECURITY;

-- Policy: Allow all operations for authenticated users
CREATE POLICY "Enable all for authenticated users"
ON "BOTs"
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- Policy: Allow read for anonymous users (for initial setup/testing)
CREATE POLICY "Enable read for anon"
ON "BOTs"
FOR SELECT
TO anon
USING (true);

-- Policy: Allow write for anonymous users (for initial setup/testing)
CREATE POLICY "Enable write for anon"
ON "BOTs"
FOR ALL
TO anon
USING (true)
WITH CHECK (true);

-- Insert initial row (required for app to work)
INSERT INTO "BOTs" (id) VALUES (1)
ON CONFLICT (id) DO NOTHING;

-- Success message
SELECT 'Database setup complete! ✅' AS status;
