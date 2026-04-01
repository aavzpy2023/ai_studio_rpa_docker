# FRONTEND PROTOCOL: REACT & FEATURE FRACTALITY

## 1. STATE FRACTALITY & CLEAN COMPONENTS
- UI Components must focus ONLY on rendering.
- Component size limit: Try to keep UI render blocks under 30 lines.
- Strictly separate logic into Custom Hooks (e.g., `useUserManagement.ts`) away from Dumb Components (View).

## 1.5. REACT 19 & STATE ORCHESTRATION (v12.4)
- **React 19 Protocol:** Prioritize native async orchestration hooks (`useActionState`, `useFormStatus`, `useOptimistic`).
- **State Management:** Use `Zustand` for local/global atomic state. Avoid bloated Context providers.

## 2. DATA FETCHING (SERVER STATE)
- Data fetching MUST ONLY be done using `@tanstack/react-query` (v5+).
- The use of `useEffect` for data fetching or API calls is STRICTLY FORBIDDEN.
- Encapsulate `useQuery` and `useMutation` inside custom hooks within the `application/` layer of the feature.

## 3. STYLING & UTILITIES
- Use Tailwind CSS (v3.4.3).
- Always use the `cn()` utility (combining `clsx` and `tailwind-merge`) for dynamic class generation to avoid style conflicts.

## 4. ICONS & ROUTING
- Use `lucide-react` for all iconography. Do not import random SVG files directly if a Lucide icon exists.
- Use `react-router-dom` (v6+) for routing.
- Group features by domain folder (e.g., `src/users`, `src/inventory`), not by technical type (e.g., avoid a global `src/components` dump for domain-specific components).