-- update_issue_tracker.sql

-- Modify the existing \"issue_tracker\" table and its indexes to enhance functionality and data quality.

-- Add a NOT NULL constraint to the \"description\" column to ensure that all issues have a description.
ALTER TABLE issue_tracker
MODIFY description VARCHAR(255) NOT NULL COMMENT 'Ensures every issue includes a description';

-- Change the existing index \"issue_title_idx\" to be unique to prevent duplicate issue titles.
DROP INDEX issue_title_idx ON issue_tracker;
CREATE UNIQUE INDEX issue_title_idx ON issue_tracker (title);
-- Comment: Making issue titles unique helps avoid confusion and data duplication.

-- Add a new column \"last_updated\" to track the last modification timestamp of an issue.
ALTER TABLE issue_tracker
ADD last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tracks the last update timestamp for an issue';
-- Comment: This field is useful for tracking when issue data was last updated.
