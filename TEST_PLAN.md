# QuickBite App - Manual Test Plan

This document outlines the manual test plan for **QuickBite – Campus Food Ordering App** prototype.

---

## Test Cases Summary

| Test Case ID | Test Description | Steps | Expected Result | Actual Result | Pass/Fail |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **TC01** | Splash Screen Auto-Navigation | 1. Launch the application.<br>2. Observe the splash screen branding.<br>3. Wait 2 seconds. | Splash screen displays QuickBite branding and auto-navigates to Login/Guest screen after 2 seconds. | *Pending Manual Execution* | *Pending* |
| **TC02** | Login & Guest Access | 1. On Login screen, tap "Continue as Guest" or "Student / Staff Login". | App displays login confirmation and navigates directly to the Home screen. | *Pending Manual Execution* | *Pending* |
| **TC03** | Menu Browsing & Search/Category Filtering | 1. On Home screen, tap category chips (Meals, Beverages, Snacks).<br>2. Type query in search bar (e.g. "Burger"). | Menu updates dynamically to display only items matching selected category or search text. | *Pending Manual Execution* | *Pending* |
| **TC04** | Item Detail View & Quantity Selection | 1. Tap any food card (e.g. "Chicken Rice").<br>2. Change quantity using `+` and `-` buttons.<br>3. Tap "Add to Cart". | Item detail screen opens with full image, price, description. Quantity increases/decreases (min 1). SnackBar shows addition feedback with View Cart button. | *Pending Manual Execution* | *Pending* |
| **TC05** | Cart Management & Calculations | 1. Navigate to Cart screen.<br>2. Increase and decrease item quantity.<br>3. Remove an item.<br>4. Observe subtotal & total item count. | Quantity updates dynamic item price, subtotal, and badge count. Removing item deletes it. Empty state displayed when 0 items remain. | *Pending Manual Execution* | *Pending* |
| **TC06** | Checkout & Order Placement | 1. In Cart, tap "Proceed to Checkout".<br>2. Review pickup details and order summary.<br>3. Tap "Place Order". | Order is generated with unique ID (e.g., `QB1024`), cart clears, and Order Confirmation screen opens. | *Pending Manual Execution* | *Pending* |
| **TC07** | Order Status Tracking Simulation | 1. On Order Confirmation screen, tap "Track Order Status".<br>2. Tap "Advance Status: Set to Preparing".<br>3. Tap "Advance Status: Set to Ready for Pickup". | Order status transitions smoothly: `Placed` → `Preparing` → `Ready for Pickup` with live step indicator updates. | *Pending Manual Execution* | *Pending* |
| **TC08** | Profile & Order History View | 1. Tap Profile icon in Home screen.<br>2. View student info.<br>3. Check Order History list.<br>4. Tap any previous order. | Profile displays student details, past order list, and tapping order navigates to its live tracking screen. | *Pending Manual Execution* | *Pending* |
| **TC09** | Responsive Layout & Overflow Safety | 1. Rotate device or resize viewport/screen size.<br>2. Check home grid, detail view, and checkout card layouts. | App adapts layout cleanly (e.g. adjusts grid columns) without overflow errors or clipped text. | *Pending Manual Execution* | *Pending* |

---

> **Note for Assessor / Student:** Please complete the *Actual Result* and *Pass/Fail* columns during your physical test execution on an emulator or physical device.
