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
    {
      type: 'category',
      label: '📋 Blueprint & Planning',
      collapsed: false,
      items: [
        'blueprint/context',
        'blueprint/build_steps',
        {
          type: 'category',
          label: 'Decision Records',
          collapsed: true,
          items: [
            'blueprint/decision_records/ADR-0000-template',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: '🛠️ Development',
      collapsed: false,
      items: [
        'development/git-workflow',
        'development/github-setup-guide',
        'development/remote-repository-setup',
      ],
    },
    {
      type: 'category',
      label: '📝 Code Snippets',
      collapsed: false,
      items: [
        'snippets/architect_preamble',
      ],
    },
  ],
};

export default sidebars;
