import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  // Main documentation sidebar
  docsSidebar: [
    'README',
    {
      type: 'category',
      label: '🏗️ Architecture & System Design',
      collapsed: false,
      items: [
        'architecture/overview',
        // Future: Components and Design Decisions sections
      ],
    },
    {
      type: 'category',
      label: '🛠️ Development',
      collapsed: false,
      items: [
        'development/getting-started',
        'development/coding-standards',
        'development/workspace-organization',
        // Future: git-workflow, testing, debugging, contributing
      ],
    },
    {
      type: 'category',
      label: '🔌 API Documentation',
      collapsed: false,
      items: [
        'api/overview',
        // Future: authentication, endpoints, webhooks, sdks, rate-limits, changelog
      ],
    },
    {
      type: 'category',
      label: '👥 User Guides',
      collapsed: false,
      items: [
        'user-guides/getting-started',
        'user-guides/faq',
        // Future: Features section and troubleshooting
      ],
    },
    {
      type: 'category',
      label: '🚀 Operations',
      collapsed: false,
      items: [
        'operations/overview',
        // Future: deployment, monitoring, incident-response, backup-recovery, security
      ],
    },
  ],
};

export default sidebars;
