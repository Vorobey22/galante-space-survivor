-- Run once in Supabase SQL Editor. Does not delete or alter old scores.
ALTER TABLE public.leaderboard
ADD COLUMN IF NOT EXISTS player_id uuid;
CREATE INDEX IF NOT EXISTS leaderboard_player_id_idx
ON public.leaderboard (player_id);
-- Existing records retain NULL player_id. New browser saves include a UUID.
